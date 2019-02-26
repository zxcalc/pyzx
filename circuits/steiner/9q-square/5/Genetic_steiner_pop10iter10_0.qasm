// Initial wiring: [2, 0, 7, 1, 3, 5, 4, 6, 8]
// Resulting wiring: [2, 0, 7, 1, 3, 5, 4, 6, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[8], q[7];
cx q[5], q[4];
cx q[8], q[3];
cx q[1], q[0];
