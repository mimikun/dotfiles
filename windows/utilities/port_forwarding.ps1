# WSLのIPv4アドレスを取得
$WSL_IPV4=bash ~/get_ipv4.bash
# ホストPCのIPv4アドレスを取得
$HOST_IPV4=(Get-NetIPAddress -InterfaceAlias "イーサネット" -AddressFamily "IPv4").IPAddress
# ポートフォワーディングしたいポート番号の配列
$PORT_NUMBERS = 18080, 8000, 3000

foreach ($PORT in $PORT_NUMBERS) {
    # 古い設定を削除
    netsh interface portproxy delete v4tov4 listenport=$PORT
    # HOST_IPV4:PORTnへアクセスがあったら、WSL_IP:PORTnに転送
    netsh interface portproxy add v4tov4 listenaddress=$HOST_IPV4 listenport=$PORT connectaddress=$WSL_IPV4 connectport=$PORT
}
