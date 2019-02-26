// Initial wiring: [7, 5, 0, 6, 1, 8, 3, 2, 4]
// Resulting wiring: [7, 5, 0, 6, 1, 8, 3, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[4], q[5];
cx q[4], q[7];
cx q[5], q[4];
