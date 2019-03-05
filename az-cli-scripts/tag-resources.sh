source activate py35
current_month=$(date +%B)
az group show -n $1 --query tags
az group update -n $1 --set tags.Owner=alizaidi tags.CreationDate=$2 tags.Description=$3 tags.KeepAlive=$current_month
