reset-perms ()
{
    # Fix directory permissions
    find -type d -exec chmod u=rwx,go=rx {} \;

    # Fix file permissions
    find -type f -exec chmod u=rw,go=r {} \;
}

alias reset-perms=reset-perms
