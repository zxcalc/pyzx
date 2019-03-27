// Initial wiring: [1, 4, 3, 8, 0, 5, 2, 7, 6]
// Resulting wiring: [1, 4, 3, 8, 0, 5, 2, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[0];
cx q[6], q[1];
cx q[8], q[5];
