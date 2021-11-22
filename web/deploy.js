window.addEventListener('load', function () {
//    if (typeof web3 !== 'undefined') {
//        console.log('Web3 Detected! ' + web3.currentProvider.constructor.name)
//        window.web3 = new Web3(web3.currentProvider);
//    } else {
        console.log('No Web3 Detected... using HTTP Provider')
        window.web3 = new Web3(new Web3.providers.HttpProvider(RPC_ENDPOINT));
    //}
})

function deploy(data, spender, guardians, trustedAddresses, numConfTx, numConfChangeSpender, numConfAddTrustedAddress) {
        var contractInstance = new window.web3.eth.Contract(data.abi);

        return contractInstance.deploy({
            data: data.bytecode,
            arguments: [spender, guardians, trustedAddresses, numConfTx, numConfChangeSpender, numConfAddTrustedAddress]
          }).encodeABI()
}

function keccak256(data) {
    return window.web3.utils.keccak256(data)
}

 function loadJSON(callback) {

    var xobj = new XMLHttpRequest();
        xobj.overrideMimeType("application/json");
    xobj.open('GET', 'SocialRecoveryWallet.abi.json', true);
    xobj.onreadystatechange = function () {
          if (xobj.readyState == 4 && xobj.status == "200") {
            // Required use of an anonymous callback as .open will NOT return a value but simply returns undefined in asynchronous mode
            callback(xobj.responseText);
          }
    };
    xobj.send(null);
 }

window.logger = (flutter_value) => {
   console.log({ js_context: this, flutter_value });
}