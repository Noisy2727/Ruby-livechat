// app/javascript/components/Demo.jsx
import React from 'react';
import { useDisclosure } from '@mantine/hooks';
import { Modal, Button } from '@mantine/core';

function Demo() {
  const [opened, { open, close }] = useDisclosure(false);

  return (
    <React.Fragment>
      <Modal opened={opened} onClose={close} title="Authentication">
        <p>This is the modal content!</p>
      </Modal>

      <Button onClick={open}>Open modal</Button>
    </React.Fragment>
  );
}

export default Demo;
