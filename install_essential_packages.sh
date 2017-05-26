#!/bin/bash
echo "Installing atom packages..."

package_names_arr=("autocomplete" "autocomplete-plus" "autocomplete-modules" "block-comment-lines" "language-javascript-jsx" "atom-storybook")
packages_to_be_installed_arr=()

add_packages() {
    for package_name in ${package_names_arr[@]}
    do
      echo "Install Package: $package_name (y/n)"
      read should_install
      if [ $should_install = "y" ]; then
        echo "Adding Package $package_name"
        packages_to_be_installed_arr+=($package_name)
      fi
    done
}

install_packages() {
  for package_name in ${packages_to_be_installed_arr[@]}
  do
    echo "Installing package: $package_name"
    apm uninstall $package_name
    apm install $package_name
  done
}

add_packages
install_packages
