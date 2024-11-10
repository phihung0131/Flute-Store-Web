import ContactForm from "../components/Customer/Contact/ContactForm";
import Footer from "../components/Customer/common/Footer";
import Header from "../components/Customer/common/Header";
import { scrollToTop } from "../helper/scrollToTop";
import { useEffect } from "react";
const Contact = () => {
  useEffect(() => {
    scrollToTop();
  }, []);
  return (
    <div className="contact-page">
      <Header />
      <ContactForm />
      <Footer />
    </div>
  );
};

export default Contact;
