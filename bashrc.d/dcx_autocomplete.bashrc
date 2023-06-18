# Provides container name completions for `docker exec -it ${container} /bin/bash
_dc_name_completions() {

	function get_docker_container_names() {
		echo "$(sudo docker container ls --format='{{json .Names}}' | sed -r 's/\"//g' | sed -r ':a;N;$!ba;s/\n/ /g')"
	}

	COMPREPLY=($(compgen -W "$(get_docker_container_names)" -- "${COMP_WORDS[$COMP_CWORD]}"))
}

complete -F _dc_name_completions dcx

