content = "Now is time"

# _installassistant:*:25:25:Install Assistant:/var/empty:/usr/bin/false
# _lp:*:2642342:262423:Printing Services:/var/spool/cups:/usr/bin/false
# _postfix:*:27:27:Postfix Mail Server:/var/spool/postfix:/usr/bin/false

lp=
    with {:ok, file} = File.open("example_password"),
        content = IO.read(file, :all),
        :ok = File.close(file),
        [_, uid, gid] = Regex.run(~r/^_lp:.*?:(\d+):(\d+)/m, content)
    do
        "Group: #{gid} User: #{uid}"
    end

IO.puts lp
IO.puts content