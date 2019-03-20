// Initial wiring: [5, 6, 4, 3, 8, 0, 2, 7, 1]
// Resulting wiring: [5, 6, 4, 3, 8, 0, 2, 7, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[8], q[7];
cx q[8], q[3];
cx q[2], q[1];
cx q[1], q[0];
