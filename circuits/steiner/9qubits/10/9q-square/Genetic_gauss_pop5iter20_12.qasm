// Initial wiring: [0 2 1 3 4 5 8 6 7]
// Resulting wiring: [0 2 5 8 1 4 3 6 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[7], q[8];
cx q[7], q[6];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[0];
cx q[7], q[8];
cx q[0], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[6], q[5];
cx q[0], q[5];
cx q[2], q[1];
cx q[8], q[3];
