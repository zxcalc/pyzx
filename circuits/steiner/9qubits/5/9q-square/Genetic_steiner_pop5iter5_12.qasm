// Initial wiring: [3, 7, 5, 4, 1, 0, 8, 2, 6]
// Resulting wiring: [3, 7, 5, 4, 1, 0, 8, 2, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[3], q[8];
cx q[8], q[7];
cx q[7], q[4];
cx q[8], q[7];
cx q[7], q[8];
cx q[3], q[2];
