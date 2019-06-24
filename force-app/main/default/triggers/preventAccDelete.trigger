trigger preventAccDelete on Account (before delete) {
    for(Account acc : trigger.old){
        acc.addError('You cannot delete the account');
    }   
}