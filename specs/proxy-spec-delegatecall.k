//#Top
requires "./axioms/verification.k"

module PROXY-SPEC-DELEGATECALL
  imports VERIFICATION

  claim
    // #call msg.sender address(this) acct_code_to_exec value_to_transfer msg.value msg.data isStatic
    <k> (. => #call SRC THIS #asWord(TARGET) 0 CALLVAL CDATA false ~> #return 0 0 ~> #pc [ DELEGATECALL ]) ~> #execute ... </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> ISTANBUL </schedule>
    <ethereum>
      <evm>
        <output> .ByteArray </output>
        <statusCode> _ </statusCode>
        <endPC> _ => ?_ </endPC>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => ?_ </touchedAccounts>
        <callState>
          <program> #parseByteStack("73") ++ TARGET ++ #parseByteStack("3d366025573d3d3d3d34865af16031565b363d3d373d3d363d855af45b3d82803e603c573d81fd5b3d81f3") </program>
          <jumpDests> #computeValidJumpDests(#proxyTemplate) </jumpDests>
          <id> THIS </id>
          <caller> SRC </caller>
          <callData> CDATA </callData>
          <callValue> CALLVAL </callValue>
          <wordStack> .WordStack => 0 : #asWord(TARGET) : .ByteArray </wordStack>
          <localMem> .Memory => ?_ </localMem>
          <pc> 0 => 48 </pc>
          <gas> 5000000 => ?_ </gas>
          <memoryUsed> 0 => ?_ </memoryUsed>
          <callGas> _ => ?_ </callGas>
          <static> false </static>
          <callDepth> CD </callDepth>
        </callState>
        <substate>
          <selfDestruct> _ </selfDestruct>
          <log> _ </log>
          <refund> _ </refund>
        </substate>
        <gasPrice> _ </gasPrice>
        <origin> _ </origin>
        <blockhashes> _ </blockhashes>
        <block> _ </block>
      </evm>
      <network>
        <chainID> _ </chainID>

        <activeAccounts> SetItem(THIS) ...</activeAccounts>
        <accounts>
          <account>
            <acctID> THIS </acctID>
            <balance> BAL </balance>
            <code> _ </code>
            <storage> _ </storage>
            <origStorage> _ </origStorage>
            <nonce> _ </nonce>
          </account>
        </accounts>
        <txOrder> _ </txOrder>
        <txPending> _ </txPending>
        <messages> _ </messages>
      </network>
    </ethereum>
    requires
      #sizeByteArray(TARGET) ==Int 20
      andBool #rangeAddress(#asWord(TARGET))
      andBool #rangeAddress(SRC)
      andBool #rangeAddress(THIS)
      andBool #rangeUInt(256, CALLVAL)
      andBool #rangeUInt(256, BAL)
      andBool #range(0 <= CD < 1024)
      andBool #range(1 <= #sizeByteArray(CDATA) < 2 ^Int 16)

endmodule
