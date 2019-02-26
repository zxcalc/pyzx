// Initial wiring: [1, 3, 6, 5, 0, 7, 2, 8, 4]
// Resulting wiring: [1, 3, 6, 5, 0, 7, 2, 8, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[6], q[7];
cx q[1], q[0];
