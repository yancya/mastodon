import en from './en';
import de from './de';
import es from './es';
import hr from './hr';
import hu from './hu';
import it from './it';
import fr from './fr';
import nl from './nl';
import no from './no';
import oc from './oc';
import pt from './pt';
import pt_br from './pt-br';
import uk from './uk';
import fi from './fi';
import eo from './eo';
import ru from './ru';
import ja from './ja';
import zh_hk from './zh-hk';
import zh_cn from './zh-cn';
import bg from './bg';

const locales = {
  en,
  de,
  es,
  hr,
  hu,
  it,
  fr,
  nl,
  no,
  pt,
  'pt-BR': pt_br,
  uk,
  fi,
  eo,
  ru,
  ja,
  'zh-HK': zh_hk,
  'zh-CN': zh_cn,
  bg,
};

export default function getMessagesForLocale (locale) {
  return locales[locale];
};
