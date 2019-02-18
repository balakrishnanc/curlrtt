/^time_namelookup:/ {time_namelookup = $2}
/^time_connect:/ {time_connect = $2}
END {
    rtt_est_1 = (time_connect - time_namelookup) * 1000
    print rtt_est_1
}