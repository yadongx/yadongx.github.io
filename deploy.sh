ps -ef | grep ssh-agent | awk '{print $2}' | xargs kill -9
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

while :
do
    git reset --hard HEAD~1 
    raspistill -o image.jpg -w 512 -h 384 -rot 0
    git add image.jpg
    git commit image.jpg -m "yes,yes"
    git push --force origin master  
    
    sleep 20
done
