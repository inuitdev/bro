# @TEST-EXEC: bro -b %INPUT >out
# @TEST-EXEC: btest-diff out

# Input framework needs this.
@load base/frameworks/communication

@load base/utils/exec

event x()
	{
	print("X");
	}

event bro_init()
	{
	schedule 1sec { x() };
	local result = async Exec::run([$cmd="sleep 2; echo test"]);
	print(result);
	}
