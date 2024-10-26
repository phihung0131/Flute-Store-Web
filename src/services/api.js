import axiosInstance from "../axios/axios";

export const apiService = {
  // login: (credentials) =>
  //   axiosInstance.post("/login", JSON.stringify(credentials)),
  // register: (userInfos) =>
  //   axiosInstance.post("/register", JSON.stringify(userInfos)),
  readProducts: () =>
    axiosInstance.get("/product/read.php", { requiresAuth: false }),
  readProductById: (id) =>
    axiosInstance.get(`product/show.php?productId=${id}`, { requiresAuth: false }),
  readFeedbacks: () =>
    axiosInstance.get("/feedback/read.php", { requiresAuth: false }),
  login: (credentials) =>
    axiosInstance.post("/authenticate/login.php", JSON.stringify(credentials)),
  register: (userInfos) =>
    axiosInstance.post("/authenticate/register.php", JSON.stringify(userInfos)),
};

export default apiService;
