import axiosInstance from "../axios/axios";

export const apiService = {
  // login: (credentials) =>
  //   axiosInstance.post("/login", JSON.stringify(credentials)),
  // register: (userInfos) =>
  //   axiosInstance.post("/register", JSON.stringify(userInfos)),
  readProducts: () =>
    axiosInstance.get("/product/read.php", { requiresAuth: false }),
};

export default apiService;
