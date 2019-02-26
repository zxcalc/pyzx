// Initial wiring: [0, 5, 2, 8, 6, 4, 7, 3, 1]
// Resulting wiring: [0, 5, 2, 8, 6, 4, 7, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[8], q[7];
cx q[7], q[8];
cx q[7], q[6];
cx q[8], q[7];
cx q[5], q[4];
cx q[8], q[3];
cx q[7], q[8];
cx q[4], q[1];
