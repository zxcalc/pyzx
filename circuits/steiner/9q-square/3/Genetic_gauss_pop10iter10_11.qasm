// Initial wiring: [5 1 2 3 7 0 6 8 4]
// Resulting wiring: [5 1 2 3 7 0 6 8 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[4], q[5];
cx q[5], q[0];
