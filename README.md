# Nanoc-Build-Pages

A simple GitHub Action for producing Nanoc build artifacts compatible with GitHub Pages. Derived from [jekyll-build-pages](https://github.com/actions/jekyll-build-pages).

# Scope

This is used along with [`actions/deploy-pages`](https://github.com/actions/deploy-pages) to use Github's support for building Pages with Actions (currently in public beta for public repositories).

# Usage

See [action.yml](action.yml).

Note that actually using this in a workflow is somewhat fiddly when I'm writing this readme, because Github Pages does not have official support for custom workflows. It is doable with some hacking.

The main problem you face is that Github actions must be configured to work with a branch. In order to use this action to build your page, you'll need a custom workflow calling this action and then uploading the build artifact
and deploying it to Github Pages. However Github will also kick off it's own workflow when you push to the configure branch, and this workflow cannot be disabled (if you do, it'll re-enable next time you push to the branch).

In order to work around this:

* Create a dummy branch in your repository.
* Configure Github Pages to build from this branch.
* Go to Environments and then to the github-pages environment.
* Change from All Branches to Protected Branches. Counter intuitively, this is required to allow your actual branch to deploy to the github-pages environment.

As far as the actual workflow you will need, [here's an example from my own website using this action](https://github.com/SamStephens/antipatterns.postmoderncore.com/blob/main/.github/workflows/build-deploy-page.yml).

# Caveats

Pages with Actions is currently in beta. However, based on guidance in [actions/deploy-pages/issues/20](https://github.com/actions/deploy-pages/issues/20) I believe the pages API is stable enough to make it safe to use this workflow.
However that is not guaranteed. Note also you'll be relying on hacks, as per the usage section, and the setup will change when custom workflows are made available; although I expect this action should continue to be usable with
minimal changes; you're just likely to need to change the setup of the project you're using this in to publish to pages.

# License

The scripts and documentation in this project are released under the [MIT License](LICENSE).
