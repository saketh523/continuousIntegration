trigger preventDupAccount on Account(before insert){
    for(Account a : trigger.new){
        System.debug(a);
            }
    for(Account b : trigger.old){
        System.debug(b);
    }
        }