# "Aliases" to other functions
function gms {
	param
	(
		[Parameter(Mandatory=$true, ValueFromPipeline=$true, ValueFromPipelineByPropertyName=$true)]
		$o
	)
	process {
		Get-Member -InputObject $o -Static
	}
}