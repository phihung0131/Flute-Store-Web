import React from "react";
import { useSelector, useDispatch } from "react-redux";
import { useNavigate } from "react-router-dom";
import { showToast } from "../../helper/showToast";
import { clearCart } from "../../redux/action/cartAction";
const CheckoutItem = (props) => {
  return (
    <div className="flex items-start gap-4">
      <div className="w-32 h-28 max-lg:w-24 max-lg:h-24 flex p-3 shrink-0 bg-gray-300 rounded-md">
        <img
          src={props.image}
          className="w-full object-contain"
          alt={props.productName}
        />
      </div>
      <div className="w-full">
        <h3 className="text-base text-white">{props.productName}</h3>
        <ul className="text-xs text-gray-300 space-y-2 mt-2">
          <li className="flex flex-wrap gap-4">
            Số lượng <span className="ml-auto">{props.quantity}</span>
          </li>
          <li className="flex flex-wrap gap-4">
            Tổng tiền{" "}
            <span className="ml-auto">${props.price * props.quantity}</span>
          </li>
        </ul>
      </div>
    </div>
  );
};

const CheckoutForm = () => {
  const navigate = useNavigate();
  const dispatch = useDispatch();
  const cartItems = useSelector((state) => state.cart.items);
  const totalPrice = cartItems
    .reduce((total, item) => total + item.price * item.quantity, 0)
    .toFixed(2);

  const handleCancelOrder = () => {
    showToast.warning("Đã hủy đặt hàng");
    navigate("/");
  };

  const handleCompleteOrder = () => {
    showToast.success("Đã hoàn thành đặt hàng");
    dispatch(clearCart());
    navigate("/");
  };

  return (
    <div className="font-[sans-serif] bg-white p-10">
      <div className="flex max-sm:flex-col gap-12 max-lg:gap-4 h-full">
        <div className="bg-gradient-to-r from-gray-800 via-gray-700 to-gray-800 sm:h-screen sm:sticky sm:top-0 lg:min-w-[370px] sm:min-w-[300px]">
          <div className="relative h-full">
            <div className="px-4 py-8 sm:overflow-auto sm:h-[calc(100vh-60px)]">
              <div className="space-y-4">
                {cartItems.map((item) => (
                  <CheckoutItem key={item.id} {...item} />
                ))}
              </div>
            </div>

            <div className="md:absolute md:left-0 md:bottom-0 bg-gray-800 w-full p-4">
              <h4 className="flex flex-wrap gap-4 text-base text-white">
                Tổng <span className="ml-auto">${totalPrice}</span>
              </h4>
            </div>
          </div>
        </div>

        <div className="max-w-4xl w-full h-max rounded-md px-4 py-8 sticky top-0">
          <h2 className="text-2xl font-bold text-gray-800">
            Hoàn thành đặt hàng
          </h2>
          <form className="mt-8">
            <div>
              <h3 className="text-base text-gray-800 mb-4">
                Thông tin khách hàng
              </h3>
              <div className="grid md:grid-cols-2 gap-4">
                <div>
                  <input
                    type="text"
                    placeholder="Họ"
                    className="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600"
                  />
                </div>

                <div>
                  <input
                    type="text"
                    placeholder="Tên"
                    className="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600"
                  />
                </div>

                <div>
                  <input
                    type="email"
                    placeholder="Email"
                    className="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600"
                  />
                </div>

                <div>
                  <input
                    type="number"
                    placeholder="Số điện thoại"
                    className="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600"
                  />
                </div>
              </div>
            </div>

            <div className="mt-8">
              <h3 className="text-base text-gray-800 mb-4">
                Địa chỉ giao hàng
              </h3>
              <div className="grid md:grid-cols-2 gap-4">
                <div>
                  <input
                    type="text"
                    placeholder="Tỉnh/Thành phố"
                    className="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600"
                  />
                </div>
                <div>
                  <input
                    type="text"
                    placeholder="Huyện/Quận"
                    className="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600"
                  />
                </div>
                <div>
                  <input
                    type="text"
                    placeholder="Xã/Thị trấn"
                    className="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600"
                  />
                </div>
                <div>
                  <input
                    type="text"
                    placeholder="Số nhà, đường"
                    className="px-4 py-3 bg-gray-100 focus:bg-transparent text-gray-800 w-full text-sm rounded-md focus:outline-blue-600"
                  />
                </div>
              </div>

              <div className="flex gap-4 max-md:flex-col mt-8">
                <button
                  type="button"
                  className="rounded-md px-6 py-3 w-full text-sm tracking-wide bg-transparent hover:bg-gray-100 border-solid border-2 border-gray-300 text-gray-800 max-md:order-1"
                  onClick={() => handleCancelOrder()}
                >
                  Hủy đặt hàng
                </button>
                <button
                  type="button"
                  className="rounded-md px-6 py-3 w-full text-sm tracking-wide bg-blue-600 hover:bg-blue-700 text-white"
                  onClick={() => handleCompleteOrder()}
                >
                  Hoàn thành đặt hàng
                </button>
              </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  );
};

export default CheckoutForm;
