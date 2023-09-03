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

:: debug settings and logic
set debug=off
if /i %debug% == on (
    @echo on
) else (
    @echo off
)

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
                    set "basicFlag=--syncmode %syncMode% --maxpeers %maxPeers% --ipcpath bitnet"
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
    set /p httpAddr=<..\settings\node_http.addr.set
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
            set "httpApiP2=%httpApiP1%,debug"
            ) else (
                set "httpApiP2=%httpApiP1%"
                )
        if /i %httpApiEth% == true (
            set "httpApiP3=%httpApiP2%,eth"
            ) else (
                set "httpApiP3=%httpApiP2%"
                )
        if /i %httpApiMiner% == true (
            set "httpApiP4=%httpApiP3%,miner"
            ) else (
                set "httpApiP4=%httpApiP3%"
                )
        if /i %httpApiNet% == true (
            set "httpApiP5=%httpApiP4%,net"
            ) else (
                set "httpApiP5=%httpApiP4"
                )
        if /i %httpApiTxPool% == true (
            set "httpApiP6=%httpApiP5%,txpool"
            ) else (
                set "httpApiP6=%httpApiP5%"
                )
        if /i %httpApiWeb3% == true (
            set "httpApiP7=%httpApiP6%,web3"
            ) else (
                set "httpApiP7=%httpApiP6%"
                )
        if "%httpApiP7:~0,1%" == "," (
            set "httpApiP7=%httpApiP7:~1%"
        )
        set httpApi=%httpApiP7%

        :: flag constructor
        if /i %httpStatus% == true (
            set "httpFlag=--http --http.port %httpPort% --http.addr %httpAddr% --http.corsdomain %httpCorsDomain% --http.vhosts %httpVhosts% --http.rpcprefix %httpRpcPrefix% --http.api %httpApi%"
        ) else (
            set "httpFlag="
        )
    
    :: graphql flag
    set /p graphqlStatus=<..\settings\node_graphql.set
    set /p graphqlCorsDomain=<..\settings\node_graphql.corsdomain.set
    set /p graphqlVhosts=<..\settings\node_graphql.vhosts.set

        :: flag constructor
        if /i %graphqlStatus% == true (
            set "graphqlFlag=--graphql --graphql.corsdomain %graphqlCorsDomain% --graphql.vhosts %graphqlVhosts%"
        ) else (
            set "graphqlFlag="
        )

    :: websocket flag
    set /p wsStatus=<..\settings\node_ws.set
    set /p wsAddr=<..\settings\node_ws.addr.set
    set /p wsOrigins=<..\settings\node_ws.origins.set
    set /p wsPort=<..\settings\node_ws.port.set
    set /p wsRpcPrefix=<..\settings\node_ws.rpcprefix.set
    set /p wsApiAdmin=<..\settings\node_ws.api.admin.set
    set /p wsApiDebug=<..\settings\node_ws.api.debug.set
    set /p wsApiEth=<..\settings\node_ws.api.eth.set
    set /p wsApiMiner=<..\settings\node_ws.api.miner.set
    set /p wsApiNet=<..\settings\node_ws.api.net.set
    set /p wsApiTxPool=<..\settings\node_ws.api.txpool.set
    set /p wsApiWeb3=<..\settings\node_ws.api.web3.set

        :: api constructor
        if /i %wsApiAdmin% == true (
            set "wsApiP1=admin"
            ) else (
                set "wsApiP1="
                )
        if /i %wsApiDebug% == true (
            set "wsApiP2=%wsApiP1%,debug"
            ) else (
                set "wsApiP2=%wsApiP1%"
                )
        if /i %wsApiEth% == true (
            set "wsApiP3=%wsApiP2%,eth"
            ) else (
                set "wsApiP3=%wsApiP2%"
                )
        if /i %wsApiMiner% == true (
            set "wsApiP4=%wsApiP3%,miner"
            ) else (
                set "wsApiP4=%wsApiP3%"
                )
        if /i %wsApiNet% == true (
            set "wsApiP5=%wsApiP4%,net"
            ) else (
                set "wsApiP5=%wsApiP4"
                )
        if /i %wsApiTxPool% == true (
            set "wsApiP6=%wsApiP5%,txpool"
            ) else (
                set "wsApiP6=%wsApiP5%"
                )
        if /i %wsApiWeb3% == true (
            set "wsApiP7=%wsApiP6%,web3"
            ) else (
                set "wsApiP7=%wsApiP6%"
                )
        if "%wsApiP7:~0,1%" == "," (
            set "wsApiP7=%wsApiP7:~1%"
        )
        set wsApi=%wsApiP7%

        :: flag constructor
        if /i %wsStatus% == true (
            set "wsFlag=--ws --ws.port %wsPort% --ws.addr %wsAddr% --ws.origins %wsOrigins% --ws.vhosts %wsVhosts% --ws.rpcprefix %wsRpcPrefix% --ws.api %wsApi%"
        )

    :: authRpc flag
    set /p authRpcStatus=<..\settings\node_authrpc.set
    set /p authRpcAddr=<..\settings\node_authrpc.addr.set
    set /p authRpcJwtSecret=<..\settings\node_authrpc.jwtsecret.set
    set /p authRpcPort=<..\settings\node_authrpc.port.set
    set /p authRpcVhosts=<..\settings\node_authrpc.vhosts.set

        :: flag constructor
        if /i %authRpcStatus% == true (
            set "authRpcFlag=--authrpc.port %authRpcPort% --authrpc.addr %authRpcAddr% --authrpc.vhosts %authRpcVhosts% --authrpc.jwtsecret %authRpcJwtSecret%"
        ) else (
            set "authRpcFlag="
        )

    :: extra flags
    set /p extraFlags=<..\settings\node_extra.set

    :: global flag constructor
    set "globalFlags=%basicFlag% %networkFlag% %minerFlag% %httpFlag% %graphqlFlag% %authRpcFlag% %extraFlags%"

    :: debug report
    if %debug% == on (
        echo.
        echo SCRIPT DEBUGGER REPORT
        echo ---------------------------------------------------------------------------
        echo Constructured Flags:
        echo ---------------------------------------------------------------------------
        echo Basic: %basicFlag%
        echo Network: %networkFlag%
        echo Miner: %minerFlag%
        echo HTTP: %httpFlag%
        echo GraphQL: %graphqlFlag%
        echo WebSocket: %wsFlag%
        echo AuthRPC: %authRpcFlag%
        echo Extra: %extraFlags%
        echo.
        echo ---------------------------------------------------------------------------
        echo Other Info:
        echo ---------------------------------------------------------------------------
        echo N/A
        echo.
        echo ---------------------------------------------------------------------------
        echo The debugger has paused the script.
        pause
    ) else (
        echo Starting script with debug module off...
    )
    
:NodeStarter
    :: starts the node with all the preset parameters and flags
    
    :InitGenesis
        :: initiates the genesis file
        echo Initiating mainnet genesis...
        .\bitnet --datadir bitnet.db init .bitnet    
        
    :StartNode
        :: starts the node
        .\bitnet --datadir bitnet.db --networkid 210 --config ..\settings\bootnodes.list %globalFlags%

:ErrorCatcher
    :: pause to display errors and exit
    pause >null
    del null
    exit