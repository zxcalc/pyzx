// Initial wiring: [7, 0, 1, 2, 5, 8, 4, 3, 6]
// Resulting wiring: [7, 0, 1, 2, 5, 8, 4, 3, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[7], q[8];
cx q[6], q[5];
cx q[8], q[3];
cx q[7], q[8];
