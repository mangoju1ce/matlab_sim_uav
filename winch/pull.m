repo = gitrepo;
if(~isempty(repo.ModifiedFiles))
    disp('有修改过的文件：')
    disp(repo.ModifiedFiles)
    disp('正在撤销修改')
    discardChanges(repo,repo.ModifiedFiles)
    disp('撤销成功')
end
pull(repo)
disp('拉取完成')

%{
discardChanges(repo,repo.ModifiedFiles) 
pull(repo)
disp('拉取完成');
%}
