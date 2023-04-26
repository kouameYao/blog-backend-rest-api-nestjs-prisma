import { PrismaClient } from '@prisma/client';
import * as bcrypt from 'bcrypt';

const prisma = new PrismaClient();

const roundsOfHashing = 10;

async function main() {
  const passwordSabin = await bcrypt.hash('password-sabin', roundsOfHashing);
  const passwordAlex = await bcrypt.hash('password-alex', roundsOfHashing);

  const user1 = await prisma.user.upsert({
    where: { email: 'sabin@adams.com' },
    update: {
      password: passwordSabin,
    },
    create: {
      email: 'sabin@adams.com',
      nom: 'Sabin Adams',
      password: passwordSabin,
    },
  });

  const user2 = await prisma.user.upsert({
    where: { email: 'alex@ruheni.com' },
    update: {
      password: passwordAlex,
    },
    create: {
      email: 'alex@ruheni.com',
      nom: 'Alex Ruheni',
      password: passwordAlex,
    },
  });

  const site1 = await prisma.site.upsert({
    where: { code: 100 },
    update: {},
    create: {
      code: 100,
      libelle: 'Site 1',
    },
  });

  const site2 = await prisma.site.upsert({
    where: { code: 200 },
    update: {},
    create: {
      code: 200,
      libelle: 'Site 2',
    },
  });

  const commande1 = await prisma.commande.upsert({
    where: { noCmd: '45TOm' },
    update: {},
    create: {
      noCmd: '45TOm',
      siteId: 1,
    },
  });

  const commande2 = await prisma.commande.upsert({
    where: { noCmd: '4RTFD001' },
    update: {},
    create: {
      noCmd: '4RTFD001',
      siteId: 1,
    },
  });

  const reception1 = await prisma.reception.upsert({
    where: {
      code: '4RTFD001',
    },
    update: {},
    create: {
      code: '4RTFD001',
      commandeId: 1,
    },
  });

  const reception2 = await prisma.reception.upsert({
    where: {
      code: '4RTFD002',
    },
    update: {},
    create: {
      code: '4RTFD002',
      commandeId: 2,
    },
  });

  const camion1 = await prisma.truck.upsert({
    where: {
      matricule: '124JU01',
    },
    update: {},
    create: {
      matricule: '124JU01',
      type: '15T',
      marque: 'Toyota',
    },
  });

  const camion2 = await prisma.truck.upsert({
    where: {
      matricule: '124JTY03',
    },
    update: {},
    create: {
      matricule: '124JTY03',
      type: '45T',
      marque: 'Hyndai',
    },
  });

  console.log('-------------- USERS ----------------');
  console.log({ user1, user2 });

  console.log('-------------- SITES ----------------');
  console.log({ site1, site2 });

  console.log('-------------- COMMANDES ----------------');
  console.log({ commande1, commande2 });

  console.log('-------------- RECEPTIONS ----------------');
  console.log({ reception1, reception2 });

  console.log('-------------- CAMIONS ----------------');
  console.log({ camion1, camion2 });
}

// execute the main function
main()
  .catch((e) => {
    console.error(e);
    process.exit(1);
  })
  .finally(async () => {
    // close the Prisma Client at the end
    await prisma.$disconnect();
  });
