import React from "react";
import { NavLink } from "react-router-dom";

const Footer = () => {
  return (
    <footer class="bg-gradient-to-r from-gray-900 via-gray-700 to-gray-900 font-sans tracking-wide">
      <div class="py-12 px-12">
        <div class="flex flex-wrap items-center sm:justify-between max-sm:flex-col gap-6">
          <div>
            <NavLink to="/">
              <img src="/logo.png" alt="logo" class="h-[40px] " />
            </NavLink>
          </div>

          <ul class="flex items-center justify-center flex-wrap gap-y-2 md:justify-end space-x-6">
            <li>
              <NavLink
                to="/"
                className="text-gray-300 hover:underline text-base"
              >
                Trang chủ
              </NavLink>
            </li>
            <li>
              <NavLink
                to="/shop"
                className="text-gray-300 hover:underline text-base"
              >
                Sản phẩm
              </NavLink>
            </li>
            <li>
              <NavLink
                to="/about"
                className="text-gray-300 hover:underline text-base"
              >
                Thông tin
              </NavLink>
            </li>
            <li>
              <NavLink
                to="/contact"
                className="text-gray-300 hover:underline text-base"
              >
                Liên hệ
              </NavLink>
            </li>
          </ul>
        </div>

        <hr class="my-6 border-gray-500" />

        <p class="text-center text-gray-300 text-base">
          © SaoTruc. All rights reserved.
        </p>
      </div>
    </footer>
  );
};

export default Footer;
