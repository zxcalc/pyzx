// Initial wiring: [0 2 3 1 4 5 6 7 8]
// Resulting wiring: [5 2 3 6 1 0 4 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[0];
cx q[3], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[7], q[8];
cx q[1], q[4];
cx q[1], q[4];
cx q[1], q[4];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[7], q[4];
cx q[3], q[8];
cx q[0], q[5];
cx q[0], q[5];
cx q[0], q[5];
cx q[1], q[4];
cx q[8], q[7];
cx q[7], q[6];
cx q[7], q[6];
cx q[7], q[6];
cx q[1], q[0];
cx q[8], q[7];
