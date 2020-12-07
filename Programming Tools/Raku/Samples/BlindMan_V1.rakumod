class Human {
    has Dog $dog;      # Can contain any kind of Dog, whether it does the
    ...                # Guide role or not
}
role Blind {
    has Guide $guide;  # Can contain any object that does the Guide role,
    ...                # whether it is a Dog or something else
}
