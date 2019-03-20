// Initial wiring: [0 1 2 4 7 6 5 3 8]
// Resulting wiring: [0 1 2 4 8 5 6 3 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[5], q[4];
cx q[0], q[5];
cx q[7], q[4];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[6];
cx q[5], q[4];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[0], q[5];
cx q[1], q[4];
cx q[2], q[3];
cx q[6], q[7];
