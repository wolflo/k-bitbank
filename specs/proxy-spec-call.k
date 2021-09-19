//#Top
requires "./axioms/verification.k"

module PROXY-SPEC-CALL
  imports VERIFICATION

  claim
    <k> (. => #call THIS #asWord(TARGET) #asWord(TARGET) CALLVAL CALLVAL .ByteArray false ~> #return 0 0 ~> #pc [ CALL ]) ~> #execute ... </k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> ISTANBUL </schedule>
    <ethereum>
      <evm>
        <output> .ByteArray </output>
        <statusCode> _ </statusCode>
        <endPC> _ => ?_ </endPC>
        <callStack> .List </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => ?_ </touchedAccounts>
        <callState>
          <program> #parseByteStack("73") ++ TARGET ++ #parseByteStack("3d366025573d3d3d3d34865af16031565b363d3d373d3d363d855af45b3d82803e603c573d81fd5b3d81f3") </program>
          <jumpDests> #computeValidJumpDests(#proxyTemplate) </jumpDests>
          <id> THIS </id>
          <caller> _ </caller>
          <callData> .ByteArray </callData>
          <callValue> CALLVAL </callValue>
          <wordStack> .WordStack => 0 : #asWord(TARGET) : .WordStack </wordStack>
          <localMem> .Memory => ?_ </localMem>
          <pc> 0 => 33 </pc>
          <gas> 5000000 => ?_ </gas>
          <memoryUsed> 0 => ?_ </memoryUsed>
          <callGas> _ => ?_ </callGas>
          <static> false </static>
          <callDepth> 1 </callDepth>
        </callState>
        <substate>
          <selfDestruct> .Set </selfDestruct>
          <log> .List </log>
          <refund> 0 </refund>
        </substate>
        <gasPrice> 0 </gasPrice>
        <origin> _ </origin>
        <blockhashes> _ </blockhashes>
        <block>
          <previousHash> _ </previousHash>
          <ommersHash> _ </ommersHash>
          <coinbase> _ </coinbase>
          <stateRoot> _ </stateRoot>
          <transactionsRoot> _ </transactionsRoot>
          <receiptsRoot> _ </receiptsRoot>
          <logsBloom> _ </logsBloom>
          <difficulty> _ </difficulty>
          <number> _ </number>
          <gasLimit> _ </gasLimit>
          <gasUsed> _ </gasUsed>
          <timestamp> _ </timestamp>
          <extraData> _ </extraData>
          <mixHash> _ </mixHash>
          <blockNonce> _ </blockNonce>
          <ommerBlockHeaders> _ </ommerBlockHeaders>
        </block>
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
      andBool notBool (#asWord(TARGET) in #precompiledAccounts(ISTANBUL))
      andBool BAL ==Int 10
      andBool CALLVAL ==Int 5

endmodule
