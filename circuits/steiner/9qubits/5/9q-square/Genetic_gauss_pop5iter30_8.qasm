// Initial wiring: [1 4 2 3 0 5 6 8 7]
// Resulting wiring: [1 4 2 3 0 5 6 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[5], q[4];
cx q[0], q[5];
cx q[2], q[1];
cx q[8], q[3];
