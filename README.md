Adding a build number label to an app is simple task, but it can get neglected.

This library promotes it from 'simple' to 'dead-simple', so there's no excuse! Now all your builds can have visible build numbers for testers & QA to reference.

Installation:

1. Add `pod 'BuildNumberLabel'` to your Podfile
1. run `pod install`

Sammple usage:

    import BuildNumberLabel

    // if the defaults are ok:
    BuildNumberLabel.create().addToView(view)


There are some options if you need to customize the appearance and layout:

    BuildNumberLabel.create(
        font: UIFont(name: "HelveticaNeue-Bold", size: 10),
        color: UIColor.lightGrayColor()
    ).addToView(
        view,
        vertical: .Top,
        verticalPadding: 70.0
    )
