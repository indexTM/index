
do
local function pre_process(msg)
if not is_momod(msg)  then
if msg then
    local hash = 'mustafaip:'..msg.to.id

    if redis:get(hash) and msg.text then
    delete_msg(msg.id, ok_cb, true)
 
    end
end
end
    return msg
    end


local function run(msg, matches)
    chat_id =  msg.to.id
    if is_admin and matches[1] == 'locktext' then
    local hash = 'mustafaip:'..msg.to.id
    redis:set(hash, true)
    return "locked text done"
    elseif is_admin(msg) and matches[1] == 'unlocktext' then
    local hash = 'mustafaip:'..msg.to.id
    redis:del(hash)
    return ' TexT has been unlocked'
    end
    end


return {
    patterns = {
        '^[!/](locktext)$',
        '^[!/](unlocktext)$'
    },
    run = run,
    pre_process = pre_process
}
end
