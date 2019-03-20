// Initial wiring: [0 1 4 2 3 5 6 8 7]
// Resulting wiring: [0 1 4 2 3 5 6 8 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[4], q[5];
cx q[6], q[7];
