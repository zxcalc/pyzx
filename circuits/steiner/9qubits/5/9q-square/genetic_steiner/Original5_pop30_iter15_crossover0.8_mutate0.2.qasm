// Initial wiring: [0, 5, 8, 3, 6, 4, 2, 7, 1]
// Resulting wiring: [0, 5, 8, 3, 6, 4, 2, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[5], q[4];
cx q[4], q[1];
cx q[8], q[7];
cx q[8], q[3];
