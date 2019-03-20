// Initial wiring: [3, 4, 2, 7, 0, 8, 6, 5, 1]
// Resulting wiring: [3, 4, 2, 7, 0, 8, 6, 5, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[4], q[7];
cx q[4], q[3];
