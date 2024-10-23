import Footer from "../components/common/Footer";
import Header from "../components/common/Header";
import FilterSidebar from "../components/Shop/FilterSidebar";
import ProductsList from "../components/Shop/ProductsList";

const Shop = () => {
  return (
    <div>
      <Header />
      {/* Main content area */}
      <main className="flex-1 pt-[10px]">
        {" "}
        {/* Add padding-top to account for fixed header */}
        <div className="container mx-auto px-4">
          <div className="flex flex-col md:flex-row gap-6">
            {/* Sidebar container */}
            <aside className="md:w-64 flex-shrink-0">
              <FilterSidebar />
            </aside>

            {/* Products grid container */}
            <div className="flex-1">
              {/* Products grid */}
              <ProductsList />
            </div>
          </div>
        </div>
      </main>
      <Footer />
    </div>
  );
};

export default Shop;
