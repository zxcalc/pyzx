// Initial wiring: [5 1 2 8 3 6 0 7 4]
// Resulting wiring: [5 1 2 8 3 6 0 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[6], q[7];
cx q[4], q[7];
