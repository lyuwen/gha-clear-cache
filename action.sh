set -e
for repo in $(gh repo list | grep docker | cut -f 1);
do
  echo Deleting caches for $repo;
  cacheKeylist=$(gh actions-cache list -R $repo -L 100 | grep "day ago" | cut -f 1)
  for key in $cacheKeylist;
  do
    gh actions-cache delete $key -R $repo --confirm;
  done
done
echo "Done"

