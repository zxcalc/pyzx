// Initial wiring: [1, 7, 2, 4, 8, 5, 6, 3, 0]
// Resulting wiring: [1, 7, 2, 4, 8, 5, 6, 3, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[4];
cx q[8], q[7];
cx q[6], q[7];
