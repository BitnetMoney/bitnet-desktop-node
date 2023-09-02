:: win64
:: node starter script
::
:: Copyright 2023 Bitnet
:: This file is part of the Bitnet library.
::
:: This software is provided "as is", without warranty of any kind,
:: express or implied, including but not limited to the warranties
:: of merchantability, fitness for a particular purpose and
:: noninfringement. In no even shall the authors or copyright
:: holders be liable for any claim, damages, or other liability,
:: whether in an action of contract, tort or otherwise, arising
:: from, out of or in connection with the software or the use or
:: other dealings in the software.

@echo off
title Bitnet Local Node

:ImportsAndConstructors
    
    :: basic settings
    set /p syncMode=<..\settings\node_syncmode.set
    set /p nodeName=<..\settings\node_name.set
    set /p maxPeers=<..\settings\node_maxpeers.set
    set /p ipcDisable=<..\settings\node_ipcdisable.set
        
        :: flag constructor
        if /i %ipcDisable% == true (
            set "basicFlag=--syncmode %syncMode% --maxpeers %maxPeers% --ipcdisable"
                ) else (
                    set "basicFlag=--syncmode %syncMode% --maxpeers %maxPeers%"
                    )
    
    :: networking
    set /p andStatus=<..\settings\node_nodiscover.set
    set /p nodePort=<..\settings\node_port.set
        
        :: flag constructor
        if /i %andStatus% == true (
            set "networkFlag=--port %nodePort% --nodiscover"
                ) else (
                    set "networkFlag=--port %nodePort%"
                    )
    
    :: node mining
    set /p miningStatus=<..\settings\node_mine.set
    set /p coinbase=<..\settings\node_miner.coinbase.set
        
        :: flag constructor
        if /i %miningStatus% == true (
            set "minerFlag=--mine --miner.etherbase %coinbase%" 
                ) else (
                    set "minerFlag="
                    )
    
    
    :: http flag
    set /p httpStatus=<..\settings\node_http.set
    set /p httpAddr=<..\settings\node_http_addr.set
    set /p httpCorsDomain=<..\settings\node_http.corsdomain.set
    set /p httpPort=<..\settings\node_http.port.set
    set /p httpRpcPrefix=<..\settings\node_http.rpcprefix.set
    set /p httpVhosts=<..\settings\node_http.vhosts.set
    set /p httpApiAdmin=<..\settings\node_http.api.admin.set
    set /p httpApiDebug=<..\settings\node_http.api.debug.set
    set /p httpApiEth=<..\settings\node_http.api.eth.set
    set /p httpApiMiner=<..\settings\node_http.api.miner.set
    set /p httpApiNet=<..\settings\node_http.api.net.set
    set /p httpApiTxPool=<..\settings\node_http.api.txpool.set
    set /p httpApiWeb3=<..\settings\node_http.api.web3.set
    
        :: api constructor
        if /i %httpApiAdmin% == true (
            set "httpApiP1=admin"
            ) else (
                set "httpApiP1="
                )
        if /i %httpApiDebug% == true (
            set "httpApiP2=debug,%httpApiP1%"
            ) else (
                set "httpApiP2=%httpApiP1%"
                )
        if /i %httpApiEth% == true (
            set "httpApiP3=eth,%httpApiP2%"
            ) else (
                set "httpApiP3=%httpApiP2%"
                )
        if /i %httpApiMiner% == true (
            set "httpApiP4=miner,%httpApiP3%"
            ) else (
                set "httpApiP4=%httpApiP3%"
                )
        if /i %httpApiNet% == true (
            set "httpApiP5=net,%httpApiP4%"
            ) else (
                set "httpApiP5=%httpApiP4"
                )
        if /i %httpApiTxPool% == true (
            set "httpApiP6=txpool,%httpApiP5%"
            ) else (
                set "httpApiP6=%httpApiP5"
                )
        if /i %httpApiWeb3% == true (
            set "httpApiP7=web3,%httpApiP6%"
            ) else (
                set "httpApiP7=%httpApiP6%"
                )
        set httpApi=%httpApiP7%

        :: flag constructor
        if /i %httpStatus% == true (
            set "httpFlag=--http --http.port %httpPort% --http.addr %httpAddr% --http.corsdomain %httpCorsDomain% --http.vhosts %httpVhosts% --http.rpcprefix %httpRpcPrefix% --http.api %httpApi%"
        ) else (
            set "httpFlag="
        )
    
    :: extra flags
    set /p extraFlags=<..\settings\node_extra.set

    echo %basicFlag% %networkFlag% %httpFlag% %minerFlag%
    pause
    
:NodeStarter
    :: starts the node with the default plus extra flags,
    :: and .config settings
    
    :InitGenesis
        :: initiates the genesis file
        echo Initiating mainnet genesis...
        .\bitnet --datadir bitnet.db init .bitnet    
        
    :StartNode
        :: starts the node
        .\bitnet --networkid 210 --config .config %extraFlags%

:ErrorCatcher
    :: pause to display errors and exit
    pause >null
    del null
    exit