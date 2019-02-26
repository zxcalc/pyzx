// Initial wiring: [1, 3, 5, 2, 6, 0, 8, 7, 4]
// Resulting wiring: [1, 3, 5, 2, 6, 0, 8, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[8], q[7];
cx q[7], q[4];
cx q[8], q[7];
cx q[8], q[3];
