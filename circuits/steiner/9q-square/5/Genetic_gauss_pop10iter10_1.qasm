// Initial wiring: [0 1 2 3 5 4 6 7 8]
// Resulting wiring: [0 1 2 8 4 5 7 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[3];
cx q[0], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[4], q[5];
cx q[3], q[8];
cx q[3], q[8];
cx q[3], q[8];
cx q[8], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[6], q[7];
cx q[1], q[4];
cx q[8], q[7];
