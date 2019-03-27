// Initial wiring: [7, 5, 4, 6, 2, 8, 0, 3, 1]
// Resulting wiring: [7, 5, 4, 6, 2, 8, 0, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[6], q[5];
cx q[5], q[4];
cx q[3], q[8];
cx q[2], q[3];
