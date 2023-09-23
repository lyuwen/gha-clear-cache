set -e
for repo in $@;
do
  echo Deleting caches for $repo;
  cacheKeylist=$(gh actions-cache list -R $repo -L 100 | cut -f 1)
  for key in $cacheKeylist;
  do
    gh actions-cache delete $key -R $repo --confirm;
  done
done
echo "Done"

