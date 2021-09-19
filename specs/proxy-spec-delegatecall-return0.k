//#Top
requires "./axioms/verification.k"

module PROXY-SPEC-DELEGATECALL-RETURN0
  imports VERIFICATION

  claim
    <k> #execute => #halt ...</k>
    <exit-code> 1 </exit-code>
    <mode> NORMAL </mode>
    <schedule> ISTANBUL </schedule>
    <ethereum>
      <evm>
        <output> .ByteArray </output>
        <statusCode> _ => #if SUCCESS ==Int 0 #then EVMC_REVERT #else EVMC_SUCCESS #fi </statusCode>
        <endPC> _ => ?_ </endPC>
        <callStack> _ </callStack>
        <interimStates> _ </interimStates>
        <touchedAccounts> _ => ?_ </touchedAccounts>
        <callState>
          <program> #proxyTemplate </program>
          <jumpDests> #computeValidJumpDests(#proxyTemplate) </jumpDests>
          <id> _ </id>
          <caller> _ </caller>
          <callData> _ </callData>
          <callValue> _ </callValue>
          <wordStack> SUCCESS : 0 : _ : .WordStack => ?_ </wordStack>
          <localMem> _ => ?_ </localMem>
          <pc> 49 => ?_ </pc>
          <gas> 5000000 => ?_ </gas>
          <memoryUsed> MEMSIZE => ?_ </memoryUsed>
          <callGas> _ </callGas>
          <static> false </static>
          <callDepth> _ </callDepth>
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
        <activeAccounts> _ </activeAccounts>
        <accounts> _ </accounts>
        <txOrder> _ </txOrder>
        <txPending> _ </txPending>
        <messages> _ </messages>
      </network>
    </ethereum>
    requires
      #range(0 <= MEMSIZE < pow256)

endmodule
