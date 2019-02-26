// Initial wiring: [1, 7, 0, 8, 3, 5, 6, 4, 2]
// Resulting wiring: [1, 7, 0, 8, 3, 5, 6, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[6], q[5];
cx q[1], q[0];
