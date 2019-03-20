// Initial wiring: [5 1 2 3 4 0 8 6 7]
// Resulting wiring: [5 1 2 3 4 0 8 6 7]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[8], q[7];
cx q[4], q[7];
